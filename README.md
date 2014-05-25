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

## Modifications

| Description									 | Verb          | URL | example |
| ------------- | ----------- | ----------- | ----------- |
| Update une description dans une profile | POST | /people/{id}/description | [http://10.12.1.135:9000/api/v1/people/1/description](http://10.12.1.135:9000/api/v1/people/1/description) payload : {"description":"text"} |

# Team
## Recherche
| Description									 | Verb          | URL | example |
| ------------- | ----------- | ----------- | ----------- |
| rechercher une équipe par son nom | GET| /teams/{name} | [http://10.12.1.135:9000/api/v1/teams/Techno%20Garden](http://10.12.1.135:9000/api/v1/teams/Techno%20Garden)|
| rechercher une équipe par son id | GET| /teams/{id} | [http://10.12.1.135:9000/api/v1/teams/4](http://10.12.1.135:9000/api/v1/teams/4)|
| rechercher les équipes associées à une techno|GET| /technos/{code}/teams| [http://10.12.1.135:9000/api/v1/technos/PHP/teams](http://10.12.1.135:9000/api/v1/technos/PHP/teams)|
| rechercher les équipes proches d'une autre équipe, renvoie 4 résultats au max | GET | /teams/{teamid}/proximity/teams | [http://10.12.1.135:9000/api/v1/teams/1/proximity/teams](http://10.12.1.135:9000/api/v1/teams/1/proximity/teams) |

## Modifications

| Description									 | Verb          | URL | example |
| ------------- | ----------- | ----------- | ----------- |
| Ajouter une techno à une equipe | PUT | /teams/{id}/technos | [http://10.12.1.135:9000/api/v1/teams/1/technos](http://10.12.1.135:9000/api/v1/teams/1/technos) payload : {"techno_id":108} ou {"techno_id":108, "level_usage":"4"} |
| Ajouter une techno à une equipe | PUT | /teams/{id}/technos/{techno_id} | [http://10.12.1.135:9000/api/v1/teams/1/technos/94](http://10.12.1.135:9000/api/v1/teams/1/technos/94) payload : rien ou {"level_usage":"4"} |
| Retirer une techno d'une equipe | DELETE | /teams/{id}/technos/{techno_code} | [http://10.12.1.135:9000/api/v1/teams/1/technos/docker](http://10.12.1.135:9000/api/v1/teams/1/technos/docker)  |



# Techno
## Recherche
| Description									 | Verb          | URL | example |
| ------------- | ----------- | ----------- | ----------- |
|  rechercher une techno par son code | GET |  /technos/{code} |  [http://10.12.1.135:9000/api/v1/technos/PHP](http://10.12.1.135:9000/api/v1/technos/PHP) | 
|  rechercher les technos associées à un id d'equipe | GET |  /teams/{id}/technos | [http://10.12.1.135:9000/api/v1/teams/1/technos](http://10.12.1.135:9000/api/v1/teams/1/technos) |
|  rechercher les technos associées à un nom d'equipe | GET |  /teams/{name}/technos | [http://10.12.1.135:9000/api/v1/teams/Techno%20Garden/technos](http://10.12.1.135:9000/api/v1/teams/Techno%20Garden/technos) | 
|  rechercher les technos associées à une personne | GET|  /people/{username}/technos|  [http://10.12.1.135:9000/api/v1/people/vjeantet/technos](http://10.12.1.135:9000/api/v1/people/vjeantet/technos) | 
|  recherche les technos d'une équipe utilisé par un de ses membres. | GET |  /teams/{name}/peoples/{username}/technos | *Not implemented yet* | 
|  recherche tous les technos dans la base. | GET |  /technos | [http://local.42.fr:9000/api/v1/technos](http://local.42.fr:9000/api/v1/technos)| 

# Events
## Recherche
| Description									 | Verb          | URL | example |
| ------------- | ----------- | ----------- | ----------- |
|  rechercher les événements de mon équipe et des équipes proches | GET |  /team/{teamid}/events |  [http://10.12.1.135:9000/api/v1/teams/4/events](http://10.12.1.135:9000/api/v1/teams/4/events) | 
|  créer un nouvel événement | PUT |  /events |  [http://10.12.1.135:9000/api/v1/events](http://10.12.1.135:9000/api/v1/events) payload: {"event":{"user_id":"2","content":"teste","team_id":"1","technos":["PHP","Javascript","JQuery"]}}| 
|  effacer tous les événements | GET |  /deleteevents |  [http://10.12.1.135:9000/api/v1/deleteevents](http://10.12.1.135:9000/api/v1/deleteevents) | 

## Creation
| Description									 | Verb          | URL | example |
| ------------- | ----------- | ----------- | ----------- |
| créer un evenement | PUT |  /events |  [http://10.12.1.135:9000/api/v1/events](http://10.12.1.135:9000/api/v1/events) | 


# recherche Globale
| Description									 | Verb          | URL | example |
| ------------- | ----------- | ----------- | ----------- |
|  rechercher  Techno, Team, Personne (max 5 par type) | GET |  /search?q={term} |  [http://10.12.1.135:9000/api/v1/search?q=en](http://10.12.1.135:9000/api/v1/search?q=en) | 
|  rechercher les evenements associés à une équipe | GET |  teams/{teamid}/events |  [http://10.12.1.135:9000/api/v1/teams/1/events](http://10.12.1.135:9000/teams/1/events) | 

 
