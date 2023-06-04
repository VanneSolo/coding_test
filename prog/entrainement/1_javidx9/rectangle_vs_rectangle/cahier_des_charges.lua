Fonction rectangle

3 vecteurs:
-> postion
-> dimensions
-> vélocité

1 table de 4 emplacements pour contenir les 4 côtés.
-> on la nomme contact.

"**********************************************************************************************"

Fonction Ray_Vs_Rect

Paramètres:
-> vecteur ray_origin
-> vecteur ray_direction
-> rectangle target
-> vecteur contact_point
-> vecteur contact_normal
-> t_hit_near

On divise 1 par ray_direction (-> inv_dir). Ensuite on crée deux vecteurs:
-> t_near
-> t_far
Le premier est égal à la différence entre le coin supérieur gauche de target et ray_origin 
multipliée par inv_dir et le second est égal à la différence entre le coin inférieur droit de
target multipliée par inv_dir. Si l°une des composante de ces deux vecteurs n°est pas un nombre
alors on return false .
Ensuite on range les distances dans l°ordre pour que t_near soit toujours inférieur à t_far. On
vérifie après qu°il y ait bien contact entre le rayon et target sinon on return false .
t_hit_near prend la valeur maximale entre les composantes x et y de t_near. On crée une autre 
variable, t_hit_far, qui prend la valeur minimale entre les composantes x et y de t_far.

Si t_hit_far est inférieur à 0, c°est que le rayon pointe à l°opposé de target, donc on return
false . On défini alors le contact_point comme la somme de ray_origin et de t_hit_near * 
ray_direction.

Enfin on défini les coordonnées de contact_normal selon une comparaison entre les composantes
x et y de t_near.

"**********************************************************************************************"

Fonction Dynamic_Rect_Vs_Rect

Paramètres:
-> rectangle r_dynamic
-> dt
-> rectangle r_static
-> vecteur contact_point
-> vecteur contact_normal
-> contact_time

On regarde d°abord si le rectangle du joueur bouge.

On dilate le rectangle ciblé en lui ajoutant les dimensions du rectangle du joueur. On appelle
la fonction Ray_Vs_Rect dans un if avec les paramètres suivant:
-> r_dynamic.pos + r_dynamic.dimensions/2
-> r_dynamic.vélocité * dt
-> rectangle expanded_target
-> contact_point
-> contact_normal
-> contact_time

Si la fonction renvoie true alors on return un contact_time supérieur à 0 et inférieur à 1.

"**********************************************************************************************"

Fonction Resolve_Dynamic_Rect_Vs_Rect

Paramètres:
-> rectangle r_dynamic
-> dt
-> rectangle r_static

vecteur contact_point = {0, 0}
vecteur contact_normal = {0, 0}
contact_time = 0

On appelle la Dynamic_Rect_Vs_Rect dans un if. On lui passe les paramètrs suivants:
-> r_dynamic
-> dt
-> r_static
-> contact_point
-> contact_normal
-> contact_time

Si elle renvoie true alors on replace le rectangle
du joueur sur le bord du rectangle du décor avec lequel il est en collision. (Sueurs froides en
  préparation).

Enfin on ajoute à la vélocité du joueur le vecteur contact_normal multiplié par la vélocité du
joueur encore multiplié par 1 moins le contact_time.

"**********************************************************************************************"

Dans le Main un rectangle pour le joueur et un groupe avec plusieurs autres rectangles
pour tester les collisions, on les place tous dans la même liste. Le joueur occupe la première 
place. On crée aussi deux vecteurs: 
-> contact_point = {0, 0}
-> contact_normal = {0, 0}
On crée ensuite une variable t initialisée à 0 qui servira de temps 0 lors des calculs de 
collisions et une variable min_t initialisée à +inifini dont l°utilité est encore à saisir. On
crée aussi une table z, pour l°instant vide.

"**********************************************************************************************"

Dans la fonction Update, on commence par mettre à jour la position du joueur. On récupère
les coordonnées en x et en y du pointeur de la souris. Si le bouton gauche est enfoncé, on
ajoute à la vélocité la différence entre la position du curseur de la souris et de la position
du joueur; différence qui est normalisée, puis multipliée par 100 et par le dt.

On peut aussi bouger le joueur avec les flèches directionnelles en modifiant la vélocité:
-> haut: vélocité_y - 100
-> droite: vélocité_x + 100
-> bas: vélocité_y + 100
-> gauche: vélocité_x - 100

On crée une boucle qui parcours la liste des rectangles à partir du deuxième. A chaque itération
on appelle la fonction Dynamic_Rect_Vs_Rect pour vérifier s°il y a collision entre le joueur et
un autre rectangle. 
-> Paramètres:
  -> le rectangle du joueur.
  -> le delta time.
  -> le rectangle dont la position dans le tableau correspond au tour de boucle en cours.
  -> contact_point.
  -> contact_normal.
  -> t.
  
Si une collision est effectivement détectée, on insère alors dans la table z une autre table qui
contient l°itérateur en cours et t. Ensuite on trie la table z pour classer les collisions
détectée dans l°ordre de distance (complications à prévoir).
Une fois les collisions triées, on les résout dans le bon ordre, avec une boucle qui parcours
la table z (pairs ou ipairs?) et qui  à chaque itération appelle la fonction 
Resolve_Dynamic_Rect_Vs_Rect avec les paramètres suivant:
-> le rectangle du joueur.
-> le delta time.
-> le premier élément de la table z en cours de traitemnt (en fait l°ID du rectangle avec lequel
   la collision a lieu).
 
 Pour finir on met à jour la position du joueur, en y ajoutant la vélocité multipliée par le
 delta time.

"**********************************************************************************************"

Dans le Draw on dessine les rectangles. On affiche aussi le vecteur de vélocité du joueur:
-> une ligne qui va du milieu du rectangle du joueur (x + w/2, y + h/2) et qui va jusqu°à
   (x + w/2, y + h/2) + velocite qu°on normalise et qu°on multiplie par la distance que l°on
   souhaite