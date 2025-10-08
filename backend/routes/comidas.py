from flask import Blueprint, request, jsonify
from backend.database.database import db



# Cria um Blueprint do Flask para organizar as rotas de reservas.
# O prefixo da URL para estas rotas será definido no app principal.
comidas = Blueprint('comidas', __name__)

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