# Mat0 | Actividades Capitulo 1

## Parte 1

1. Indicar cuales de las siguientes frases son proposiciones:

   1. ✔️
   2. ✔️
   3. ✔️
   4. ❌

2. Expresar las siguientes proposiciones en forma simbolica, negarlas y retraducir su negacion al lenguaje coloquial:
   | Frase | Forma Simbolica | Negacion | Negacion Coloquial |
   | -- | -- | -- | -- |
   | Juana no es simpatica pero sabe bailar | ¬p ∧ q | p ∨ ¬q | Juana es simpatica o no sabe bailar |
   | Los alumnos estudian los fines de semana o se divierten | p ∨ q | ¬(p ∧ q) | Los alumnos no estudan los fines de semana o no se divierten |
   | Si los alumnos conocen a los simuladores, entonces los desprecian | p → q | p ∧ ¬q | Los alumnos conocen a los simuladores y no los desprecian |

3. Construir las tablas de verdad de:

   1. ¬(p ∧ q)
      | p | q | ¬(p ∧ q) |
      | -- | -- | -- |
      | V | V | F |
      | V | F | V |
      | F | V | V |
      | F | F | V |
   2. ¬(¬p ∧ ¬r) ∧ q
      | p | q | r | ¬(¬p ∧ ¬r) ∧ q |
      | -- | -- | -- | -- |
      | V | V | V | V |
      | V | V | F | V |
      | V | F | V | F |
      | V | F | F | F |
      | F | V | V | V |
      | F | V | F | F |
      | F | F | V | F |
      | F | F | F | F |
   3. (p → q) → r
      | p | q | r | (p → q) → r |
      | -- | -- | -- | -- |
      | V | V | V | V |
      | V | V | F | F |
      | V | F | V | V |
      | V | F | F | v |
      | F | V | V | V |
      | F | V | F | F |
      | F | F | V | V |
      | F | F | F | F |
   4. ¬(p ∨ q)
      | p | q | ¬(p ∨ q) |
      | -- | -- | -- |
      | V | V | F |
      | V | F | F |
      | F | V | F |
      | F | F | V |
   5. ¬q ∧ ¬r
      | q | r | ¬q ∧ ¬r |
      | -- | -- | -- |
      | V | V | F |
      | V | F | F |
      | F | V | F |
      | F | F | V |
   6. (¬s ∧ p) ∨ (s ∧ ¬p)
      | p | s | (¬s ∧ p) ∨ (s ∧ ¬p) |
      | -- | -- | -- |
      | V | V | F |
      | V | F | V |
      | F | V | V |
      | F | F | F |

4. ✔️

5. Escribir con palabras del lenguaje coloquial las siguientes operaciones:

   1. Tobi es el perro de mi amigo y es un caniche
   2. Tobi no es un caniche o no es un caniche que ladra todo el tiempo
   3. Tobi no es un caniche que ladra todo el tiempo pero es muy divertido
   4. Tobi es un cancihe o es divertido

6. Simbolizar las siguientes proposiciones:

   1. p → q
   2. (∃x)(p(x)) → q

7. Modificar forma coloquial y simbolizar
   | Frase original | Modificador | Frase modificada | Simbolizacion |
   | -- | -- | -- | -- |
   | Es necesario ser argentino para ser presidente de la republica. | Si... Entonces... | Si sos argentino entonces podes ser presidente de la republica | p → q |
   | Si aprobo el examen entonces contesto bien el 40 % de sus preguntas | Suficiente | Contestar bien el 40% de las preguntas es suficiente para aprobar el examen | p ↔ q |
   | Pedro es argentino solo si es americano | Necesario | Es necesario ser americano para ser argentino | p ↔ q |

8. Establecer si las siguientes f´ormulas constituyen tautolog´ıas, contradicciones o contingencias

   1. (p ∧ q) ∧ (q ∧ p) [Contingencia]
      | p | q | (p ∧ q) ∧ (q ∧ p) |
      | -- | -- | -- |
      | V | V | V |
      | V | F | F |
      | F | V | F |
      | F | F | F |
   2. (p ∨ q) → p [Contingencia]
      | p | q | (p ∨ q) → p |
      | -- | -- | -- |
      | V | V | V |
      | V | F | V |
      | F | V | F |
      | F | F | V |
   3. (q → p) ∨ p [Contingencia]
      | p | q | (q → p) ∨ p |
      | -- | -- | -- |
      | V | V | V |
      | V | F | V |
      | F | V | F |
      | F | F | V |

9. Encontrar proposiciones equivalentes usando las leyes de De Morgan y sustituciones adecuadas:
   | Ecuacion | Sustitucion |
   | -- | -- |
   | p ∧ ¬q | ¬(¬p ∧ q) |
   | ¬(¬p ∧ q) | p ∧ ¬q |
   | (p ∧ q) ∨ q | (p ∨ q) ∧ (p ∨ p) |
   | (q → p) ∨ p | (q ∧ ¬p) ∧ ¬p |

## Parte 2

| Conjuntos        | Proposiciones |
| ---------------- | ------------- |
| A ∩ B            | a ∧ b         |
| A ∪ B            | a v b         |
| A ⊆ B            | a → b         |
| C<sub>_u_</sub>A | ~a            |
| A = B            | a ↔ b         |
| A - B            | a ∧ ~b        |

1. A = {f, a, c, u, l, t, a, d}\
   B = {3,5,0,2}\
   C = {}\

2. A = {1, 2, 3} | B = {1, 2, 4, 5} | C = {2, 4}\
   A ∩ B = {1, 2}\
   A ∪ B = {1, 2, 3, 4, 5}\
   A − B = {3}\
   C<sub>B</sub>C = {1, 5}\
   B − A = {4, 5}\
   A ∩ B ∩ C = {2}\
   A - (B - C) = {2, 3}\
   (A - B) - C = {3}\
   B - C = {1, 5}\

3. A={a, e, i, o, u} | B={a, e, o} | C={i, u} | D={m, u, r, c, i, e, l, a, g, o}
   E={b, c, d, f, g, h, j, k, l ,m ,n, ñ, p, q, r, s, t, v, w, x, y, z}

   Extensión:\
   A ∩ B = {a, e, o}\
   A ∪ B = {a, e, i, o ,u}\
   A − B = {i, u}\
   C ∪ D = {m, u, r, c, i, e, l, a, g, o}\
   E − A = {b, c, d, f, g, h, j, k, l ,m ,n, ñ, p, q, r, s, t, v, w, x, y, z}\
   E − D = {b, d, f, h, j, k, n, ñ, p, q, s, t, v, w, x, y, z}\
4. 2 ∉ {1, 3, 5, 7}\
   5 ∈ {2, 4, 5, 6}\
   2 ∉ {4, 5, 6, 7}\
   0 ∉ ∅\
   1 ∉ {1, 2} − {1, 6} = {2}\
   Paris ∈ {x: x es el nombre de un país}\
   2 ∈ {1, 2} − {1, 6} = {2}\
   2 ∉ {1, 2} ∩ {1, 6} = {1}\
   Jujuy ∈ {x: x es provincia Argentina}\
   2 ∈ {1, 2} ∪ {1, 6} = {1, 2, 6}\
   a ∉ {{a}}\
   {a} ∈ {{a}}

5. | Leyes de morgan      | Teoria de conjuntos                                            |
   | -------------------- | -------------------------------------------------------------- |
   | ¬(p ∨ q) ⇔ (¬p ∧ ¬q) | C<sub>_u_</sub>(A ∪ B) = (C<sub>_u_</sub>A ∩ C<sub>_u_</sub>B) |
   | ¬(p ∧ q) ⇔ (¬p ∨ ¬q) | C<sub>_u_</sub>(A ∩ B) = (C<sub>_u_</sub>A ∪ C<sub>_u_</sub>B  |

6. A = {2, 4, 6, 8, 10} | B = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10}
   ∃x (x ∈ A ∧ x ∉ B) = Falso: Es imposible que algun elemento de A no pertenezca a B\
   ∃x (x ∈ B ∧ x ∉ A) = Verdadero: Si x pertenece a B no tiene la obligacion de pertenecer a A, ya que no todos los elementos de B pertenecen a A\
   ∀x (x ∉ B → x ∉ A) = Verdadero: Si x no pertenece a B es imposible que pertenezca a A ya que todos los elementos de A pertenecen a B\
   ∀x (x ∉ A → x ∉ B) = Falso: Es falso ya que si x no pertenece a A no es obligatorio que este no pertenezca a B, por ejemplo el 1 no pertenece a A y si pertenece a B

7. Sean A, B y C conjuntos tales que A ⊆ B y B ⊆ C. Sabiendo que a ∈ A, b ∈ B, c ∈ C, d ∉ A, e ∉ B y f ∉ C, ¿cuáles de las siguientes informaciones son ciertas?\
   A = {a}, B = {a, b} C ={a, b, c}\
   a ∈ C = ✔️\
   b ∉ A =✔️\
   b ∈ A = ❌\
   c ∉ A =✔️\
   e ∉ A = ✔️\
   f ∉ A = ✔️\
   d ∈ B = ❌\
   f ∈ C<sub>_u_</sub>C = ✔️\
   c ∈ C − B = ✔️\
   a ∈ C ∩ B = ✔️\
   b ∈ C<sub>B</sub>A = ✔️\
   d ∉ A ∩ C = ✔️
