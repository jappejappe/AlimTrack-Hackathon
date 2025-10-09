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

@comidas.route('/reservas', methods=['GET'])
def get():
    resultado = db.query('SELECT * FROM reservas;')
    return jsonify(resultado), 200