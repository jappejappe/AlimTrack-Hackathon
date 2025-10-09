from flask import Blueprint, request, jsonify
import json
from backend.database.database import db



# Cria um Blueprint do Flask para organizar as rotas de reservas.
# O prefixo da URL para estas rotas será definido no app principal.
comidas = Blueprint('comidas', __name__)

@comidas.route('/cadastrar', methods=['POST'])
def cadastrar():
    data = request.get_json(silent=True)

    nome_consumidor = data.get('nome_consumidor')
    matricula = data.get('matricula')
    cpf_consumidor = data.get('cpf_consumidor')
    senha = data.get('senha')
    dias_padrao = data.get('dias_padrao')

    if matricula:
        # Usuário preencheu matrícula -> deve ter 10 caracteres
        if len(matricula) != 10 or not matricula.isdigit():
            return jsonify({
                "status": "error",
                "message": "Matrícula inválida"
            }), 400

    elif cpf_consumidor:
        # Usuário preencheu CPF -> deve ter 11 caracteres
        if len(cpf_consumidor) != 11 or not cpf_consumidor.isdigit():
            return jsonify({
                "status": "error",
                "message": "CPF inválido"
            }), 400

    else:
        # Nenhum campo preenchido
        return jsonify({
            "status": "error",
            "message": "Informe a matrícula ou o CPF"
        }), 400

    # Executa a query para inserir o novo registro no banco de dados.
    # O uso de parâmetros (%s) previne ataques de SQL Injection.
    try:
        db.query(
            'INSERT INTO public.consumidores ' \
            '(nome_consumidor, matricula, cpf_consumidor, senha, dias_padrao) ' \
            'VALUES (%s, %s, %s, %s, %s);',
            (
                nome_consumidor,
                matricula,
                cpf_consumidor,
                senha,
                json.dumps(dias_padrao)
            )
        )

    except Exception as e:
        return jsonify({
            "status": "error",
            "message": "Erro ao cadastrar consumidor. Detalhes: " + str(e)
        }), 500

    return jsonify({
        "status": "success",
        "message": "Consumidor cadastrado com sucesso!"
    }), 201


@comidas.route('/reservar', methods=['POST'])
def reservar():
    data = request.json

    matricula = data.get('identificacao')
    hora_reserva = data.get('hora_reserva')

    try:

        if len(matricula) not in (10, 11):
            return jsonify({
                "status": "error",
                "message": "Matrícula ou cpf inválido!"
            }), 400

        # Executa a query para inserir o novo registro no banco de dados.
        # O uso de parâmetros (%s) previne ataques de SQL Injection.
        db.query(
            'INSERT INTO public.reservas ' \
            '(matricula, hora_reserva) ' \
            'VALUES (%s, %s);',
            (
                matricula,
                hora_reserva
            )
        )
    
    except Exception as e:
        return jsonify({
            "status": "error",
            "message": "Erro ao cadastrar reserva. Detalhes: " + str(e)
        }), 500

@comidas.route('/reservas', methods=['GET'])
def get():
    resultado = db.query('SELECT * FROM reservas;')
    return jsonify(len(resultado)), 200

@comidas.route('/atualizar_dias', methods=['PUT'])
def atualizar_dias():
    data = request.json

    cpf = data.get('cpf_consumidor')
    novos_dias = data.get('dias_padrao')

    try:
        if not cpf:
            return jsonify({
                "status": "error",
                "message": "CPF do consumidor é obrigatório!"
            }), 400

        if not novos_dias:
            return jsonify({
                "status": "error",
                "message": "Não foram encontradas as preferências de dias"
            }), 400

        # Atualiza o campo JSON (dias_padrao) do consumidor
        db.query(
            """
            UPDATE consumidores
            SET dias_padrao = %s
            WHERE cpf_consumidor = %s
            """,
            (json.dumps(novos_dias), cpf)
        )

        return jsonify({
            "status": "success",
            "message": "Dias padrão atualizados com sucesso!",
            "novo_json": novos_dias
        }), 200

    except Exception as e:
        return jsonify({
            "status": "error",
            "message": "Erro ao atualizar dias. Detalhes: " + str(e)
        }), 500
