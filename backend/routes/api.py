from flask import Blueprint
from backend.routes.comidas import comidas

api = Blueprint('api', __name__)

api.register_blueprint(comidas, url_prefix='/refeitorio')
