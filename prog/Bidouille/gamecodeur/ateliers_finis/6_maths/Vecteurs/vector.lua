--[[
Classe vecteur. On la crée dans un fichier séparé pour faciliter la compréhension du programme. Oncrée une fonction NewVector qui va
contenir tout le code de la classe. La fonction possède deux paramètres, pX et pY, qui seront les coordonnées du vecteur. Dans cette 
fonction on crée premièrement un tableau v. On lui attribut deux éléments: v.x, qui prend la valeur de pX et v.y qui prend la valeur
de pY. C'est ce tableau qui stockera les valeurs en x et en y du vecteur qu'on créera en appelant NewVector.

Ensuite on crée une métatable. Elle contiendra des méthodes prédéfinies par lua, ce qui permettra d'effectuer des calculs sur des
tableaux, ce qui est impossible de base dans lua. Pour ce faire, on fabrique d'abord un tableau normal, ici VectorMT. Ensuite on lui
attribut comme éléments les méthodes dont on va avoir besoin (pour nos calculs sur des vecteurs ce sera __add pour les additions, 
__sub pour les soustractions, __mul pour les multiplications et __unm pour obtenir l'opposé d'un vecteur) et pour finir on appelle la
fonction setmetatable qui prend en paramètres les deux tableaux qu'on a crée (v et VectorMT) et qui va les lier. Ainsi on pourra 
appliquer les méthodes de VectorMT sur v.

Voici maintenant une description du code inséré dans les diiférentes méthodes du tableau VectorMT:

    - dans __add:
    on lui donne deux paramètres v1 et v2 qui seront les deux vecteurs que l'on veut additionner. Dans la méthode on crée une variable 
    locale somme qui contient un vecteur NewVector. Cette variable est donc un vecteur. En coordonnée x (somme.x), on lui attribut le 
    résulat de l'addition des coordonnées en x des deux vecteurs que l'on veut ajouter. On fait la même chose pour la coordonnée y du 
    vecteur somme et enfin on retourne somme.

    - dans __sub:
    on fait presque la même chose que dans __add. Ici on appelle la variable locale diff car on souhaite obtenir la différence entre les 
    deux vecteurs et non pas leur somme mais c'est un détail, et surtout, bien évidemment, on remplace le signe + par le signe -.
    
    - dans __mul:
    les changements sont plus conséquant. Les paramètres de la méthode sont k et v. k sera le nombre par lequel on voudra multiplier 
    notre vecteur qui lui sera représenté par v. Dans la méthode on crée une variable locale prod qui sera un vecteur qui contiendra le 
    résultat du produit du vecteur par le coefficient k. Ensuite pour la coordonnée x du vecteur prod on multiplie k par la coordonnée x 
    du vecteur v, puis on répète la même opération pour la coordonnée y. et on retourne prod.

    - dans unm:
    ici c'est plus simple. La méthode prend un unique paramètre v. Dans ce cas on ne fait pas de calculs sur le vecteur, on change 
    simplement son signe, on rélise cela directement dans la variable locale opp puis on retourne cette variable qui contient donc le 
    vecteur opposé à celui que nous avons appelé.

Après la métatable, on crée deux autre fonctions que l'on attribut au tableau v: norm, qui servira à calculer la norme d'un vecteur et 
normalize, qui aura pour rôle de normaliser un vecteur, c'est-à-dire de le rendre de norme 1. Placer ces deux fonctions hors de la 
métatable n'est pas un problème car ici il ne s'agit d'affecter les coordonnées que d'un seul vecteur NewVector, cela ne posera donc pas 
de problèmes. De plus, dans le cas de norm, il n'existe pas de méthode de métatable pour calculer une racine carrée.

    Fonctionnement de norm.
    On calcul simplement la racine carrée de (v.x^2 + v.y^2), on obtient la valeur de l'hypothénuse d'un triangle rectangle v.x, v.y, 
    NewVector. NewVector étant bien sur l'hypothénuse en question.

    Fonctionnement de normalize.
    Le but est de rendre un vecteur de norme 1. Pour cela il faut multiplier l'inverse de la norme du vecteur par la norme elle-même. 
    C'est-à-dire que vecteur u.normalize = (1 / |||u|||) * u, soit u / |||u|||. On crée une variable locale N dans laquelle on calcul la 
    norme du vecteur grâce à v.norm et ensuite on divise la coordonnée en x du vecteur par N puis on fait la même chose pour la coordonnée 
    en y. Il n'est pas nécessaire de retourner quoi que ce soit car on travaille directement sur les coordonnées de NewVector.

Pour finir il ne reste plus qu'à retourner ce que contient le tableau v.
]]

function NewVector(pX, pY)
  v = {}
  v.x = pX
  v.y = pY
  
  VectorMT = {}
  
  function VectorMT.__add(v1, v2)
    local somme = NewVector(0, 0)
    somme.x = v1.x + v2.x
    somme.y = v1.y + v2.y
    return somme
  end
  
  function VectorMT.__sub(v1, v2)
    local diff = NewVector(0, 0)
    diff.x = v1.x - v2.x
    diff.y = v1.y - v2.y
    return diff
  end
  
  function VectorMT.__mul(k, v)
    local prod = NewVector(0, 0)
    prod.x = k * v.x
    prod.y = k * v.y
    return prod
  end
  
  function VectorMT.__unm(v)
    local opp = NewVector(-v.x, -v.y)
    return opp
  end
  
  setmetatable(v, VectorMT)
  
  function v.norm()
    return math.sqrt(v.x^2 + v.y^2)
  end
  
  function v.normalize()
    local N = v.norm()
    v.x = v.x / N
    v.y = v.y / N
  end
  
  return v
end