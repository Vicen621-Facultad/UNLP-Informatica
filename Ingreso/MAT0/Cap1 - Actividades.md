# Mat0 | Actividades Capitulo 1

1. Indicar cuales de las siguientes frases son proposiciones:
    1. ✔️
    2. ✔️
    3. ✔️
    4. ❌

2. Expresar las siguientes proposiciones en forma simbolica, negarlas y retraducir su
negacion al lenguaje coloquial:

    | Frase | Forma Simbolica | Negacion | Negacion Coloquial |
    | -- | -- | -- | -- |
    | Juana no es simpatica pero sabe bailar | ¬p ∧ q | p ∨ ¬q | Juana es simpatica o no sabe bailar |
    | Los alumnos estudian los fines de semana o se divierten | p ∨ q | ¬(p ∧ q) | Los alumnos no estudan los fines de semana o no se divierten |
    |  Si los alumnos conocen a los simuladores, entonces los desprecian | p → q | p ∧ ¬q | Los alumnos conocen a los simuladores y no los desprecian |

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

9. Encontrar proposiciones equivalentes usando las leyes de De Morgan y sustituciones
adecuadas:
    | Ecuacion | Sustitucion |
    | -- | -- |
    | p ∧ ¬q | ¬(¬p ∧ q) |
    | ¬(¬p ∧ q) | p ∧ ¬q |
    | (p ∧ q) ∨ q | (p ∨ q) ∧ (p ∨ p) |
    | (q → p) ∨ p | (q ∧ ¬p) ∧ ¬p |
