extends Node

var difficulty = 1

enum store_item {CERVE,CIGA}

var nombs_h = [
	"Juan",
	"Paco",
	"Pedro",
]
var nombs_m = [
	"Lucia",
	"Ana",
	"Sofia",
]

var aps = [
	"Rodriguez",
	"Perez",
	"Martinez",
	"Diaz",
	"Alvarez",
]

var profesiones = [
	"Carpintero",
	"Médico",
	"Veterinario",
	"Abogado",
	"Contador",
	"Ingeniero",
	"Desempleado...",
]

var nacionalidades = [
	"Argentina",
	"Uruguay",
	"Brasil",
	"Italia",
	"Malasia",
]

var descripciones = [
	"Habla mucho, repsonde todo",
	"Habla mas o menos, repsonde a veces",
	"No habla, no responde",
	"No se sabe nada",
]

var help = [
	4,
	2,
	0,
	1
]

var dialogs = [
	"Me das %want%, por favor.",
	"¿Tenés %want%?",
	"Hola quiero %want%",
	"¿Me podrías dar %want%?",
	"Dame %want%",
	"%want%, por favor",
]

var infos = [
	"Info",
	"Info",
	"Info",
	"Info",
]


var nacionalidad_answers = [
	"No sea xenofobo.",
	"Soy de %nacionalidad%.",
	"Soy de %nacionalidad%.",
	"Que te importa.",
	"Vivo acá pero soy de %nacionalidad%.",
	"...",
]

var profesion_answers = [
	"Ni idea.",
	"Trabajo de %profesion%.",
	"%profesion%.",
	"Que te importa.",
	"¿Me puede dar mi pedido?",
	"...",
]

var nombre_answers = [
	"...",
	"Me llamo %nombre%.",
	"Soy %nombre%.",
	"Que te importa.",
	"¿Me puede dar mi pedido?",
]

var dialogic_replace = {
	"hi_text": ""
}

var store_items_str = ["una cerveza", "unos cigarrillos"]
