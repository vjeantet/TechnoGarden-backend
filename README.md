This is the README for the backend of Techno Garden :)

# TechnoGarden API

# People
## Recherche

| Description									 | Verb          | URL | example |
| ------------- | ----------- | ----------- | ----------- |
| récupérer la liste des personnes ordonnée par nom, puis prénom | GET |  /people | [http://10.12.1.135:9000/api/v1/people](http://10.12.1.135:9000/api/v1/people) |
| recherche une personne par son username	     | GET |  /people/{username} | [http://10.12.1.135:9000/api/v1/people/vjeantet](http://10.12.1.135:9000/api/v1/people/vjeantet) |
| rechercher des personnes qui appartiennent à un nom d'équipe|GET| /teams/{name}/people | [http://10.12.1.135:9000/api/v1/teams/Techno%20Garden/people](http://10.12.1.135:9000/api/v1/teams/Techno%20Garden/people) |
| rechercher des personnes qui appartiennent à un id d'équipe|GET| /teams/{id}/people | [http://10.12.1.135:9000/api/v1/teams/1/people](http://10.12.1.135:9000/api/v1/teams/1/people) |
| rechercher des personnes par techno | GET| /technos/{code}/people | [http://10.12.1.135:9000/api/v1/technos/PHP/people](http://10.12.1.135:9000/api/v1/technos/PHP/people) |

# Team
## Recherche
| Description									 | Verb          | URL | example |
| ------------- | ----------- | ----------- | ----------- |
| rechercher une équipe par son nom | GET| /teams/{name} | [http://10.12.1.135:9000/api/v1/teams/Techno%20Garden](http://10.12.1.135:9000/api/v1/teams/Techno%20Garden)|
| rechercher une équipe par son id | GET| /teams/{id} | [http://10.12.1.135:9000/api/v1/teams/4](http://10.12.1.135:9000/api/v1/teams/4)|
| rechercher les équipes associées à une techno|GET| /technos/{code}/teams| [http://10.12.1.135:9000/api/v1/technos/PHP/teams](http://10.12.1.135:9000/api/v1/technos/PHP/teams)|
| rechercher les équipes proches d'une autre équipe, renvoie 4 résultats au max | GET | /teams/{teamid}/proximity/teams | [http://10.12.1.135:9000/api/v1/teams/1/proximity/teams](http://10.12.1.135:9000/api/v1/teams/1/proximity/teams) |

# Techno
## Recherche
| Description									 | Verb          | URL | example |
| ------------- | ----------- | ----------- | ----------- |
|  rechercher une techno par son code | GET |  /technos/{code} |  [http://10.12.1.135:9000/api/v1/technos/PHP](http://10.12.1.135:9000/api/v1/technos/PHP) | 
|  rechercher les technos associées à une equipe | GET |  /teams/{name}/technos | [http://10.12.1.135:9000/api/v1/teams/Techno%20Garden/technos](http://10.12.1.135:9000/api/v1/teams/Techno%20Garden/technos) | 
|  rechercher les technos associées à une personne | GET|  /people/{username}/technos|  [http://10.12.1.135:9000/api/v1/people/vjeantet/technos](http://10.12.1.135:9000/api/v1/people/vjeantet/technos) | 
|  recherche les technos d'une équipe utilisé par un de ses membres. | GET |  /teams/{name}/peoples/{username}/technos | *Not implemented yet* | 


 
