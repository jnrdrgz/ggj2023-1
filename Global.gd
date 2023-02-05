extends Node

var difficulty = 1

enum store_item {CERVE,CIGA}

var nombs_h = [
	"Antonio","Manuel","Jose","Francisco","David","Juan","Jose","Javier","Daniel","Jose","Francisco","Carlos","Jesus","Alejandro","Miguel","Jose","Rafael","Miguel","Pedro","Pablo","Angel","Sergio","Jose","Fernando","Jorge","Luis","Alberto","Juan","Alvaro","Adrian","Juan","Diego","Raul","Ivan","Juan","Ruben","Enrique","Oscar","Ramon","Vicente","Andres","Juan","Joaquin","Santiago","Victor","Eduardo","Mario","Roberto","Jaime","Francisco","Marcos","Ignacio","Alfonso","Jordi","Hugo","Ricardo","Salvador","Guillermo","Emilio","Gabriel","Marc","Gonzalo","Julio","Julian","Mohamed",
]
var nombs_m = [
	"Maria","Maria","Carmen","Ana","Josefa","Isabel","Maria","Maria","Laura","Maria","Ana","Cristina","Marta","Maria","Francisca","Lucia","Maria","Maria","Antonia","Dolores","Sara","Paula","Elena","Maria","Raquel","Rosa","Pilar","Concepcion","Manuela","Maria","Mercedes","Julia","Beatriz","Nuria","Silvia","Rosario","Juana","Alba","Irene","Teresa","Encarnacion","Patricia","Montserrat","Andrea","Rocio","Monica","Rosa","Alicia","Maria","Sonia","Sandra","Angela","Marina","Susana","Natalia","Yolanda","Margarita","Maria","Claudia","Eva","Maria","Inmaculada","Sofia","Maria","Carla","Ana","Esther","Noelia","Veronica","Angeles","Nerea","Carolina","Maria","Eva","Ines","Miriam","Maria","Daniela","Lorena","Ana","Maria","Maria","Victoria","Amparo",
]

var aps = [
	"Castro","Hernandez","Rodriguez","Villalba","Luna","Olivera","Mansilla","Ponce","Sosa","Quiroga","Ramirez","Juarez","Fernandez","Acosta","Campos","Garcia","Navarro","Vargas","Moreno","Blanco","Cruz","Godoy","Molina","Soria","Lopez","Torres","Herrera","Giménez","Carrizo","Dominguez","Peralta","Acuna","Benitez","Chavez","Munoz","Paz","Sanchez","Vera","Ruiz","Silva","Agüero","Castillo","Ledesma","Moyano","Pérez","Rivero","Soto","Torre","Vega","Caceres","Arias","Bustos","Cordoba","Farias","Leiva","Maldonado","Nunez","Ojeda","Velazquez","Toledo","Roldan","Pereyra","Miranda","Lucero","Ferreyra","Vazquez","Diaz","Bravo","Barrios","Cabrera","Dominguez","Figueroa","Gutiérrez","Russo","Maidana","Ortiz","Rojas","Ayala","Correa","Medina","Valdez","Rivero","Peralta","Morales","Giménez","Franco","Martin","Paez","Ramos","Aguirre","Caceres","Duarte","Flores","Mendoza","Martinez","Rios","Coronel","Méndez",
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
