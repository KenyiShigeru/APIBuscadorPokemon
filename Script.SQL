PRAGMA foreign_keys = ON;

-- =========================
-- TABLA: TIPO_EXPERIENCIA
-- =========================
CREATE TABLE tipo_experiencia (
    tipo_exp_id INTEGER PRIMARY KEY AUTOINCREMENT,
    descripcion TEXT NOT NULL UNIQUE
);

-- =========================
-- TABLA: POKEMON
-- =========================
CREATE TABLE pokemon (
    pokemon_id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL UNIQUE,
    tipo_exp_id INTEGER NOT NULL,
    ps INTEGER NOT NULL,
    atk_fisico INTEGER NOT NULL,
    atk_especial INTEGER NOT NULL,
    def_fisica INTEGER NOT NULL,
    def_especial INTEGER NOT NULL,
    velocidad INTEGER NOT NULL,
    FOREIGN KEY (tipo_exp_id) REFERENCES tipo_experiencia(tipo_exp_id)
);

-- =========================
-- TABLA: TIPO_ELEMENTAL
-- =========================
CREATE TABLE tipo_elemental (
    tipo_id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre_tipo TEXT NOT NULL UNIQUE
);

-- =========================
-- TABLA: POKEMON_TIPO (N:M)
-- =========================
CREATE TABLE pokemon_tipo (
    pokemon_id INTEGER NOT NULL,
    tipo_id INTEGER NOT NULL,
    PRIMARY KEY (pokemon_id, tipo_id),
    FOREIGN KEY (pokemon_id) REFERENCES pokemon(pokemon_id),
    FOREIGN KEY (tipo_id) REFERENCES tipo_elemental(tipo_id)
);

-- =========================
-- TABLA: MECANICA_ESPECIAL
-- =========================
CREATE TABLE mecanica_especial (
    mecanica_id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre_mecanica TEXT NOT NULL UNIQUE
);

-- =========================
-- TABLA: POKEMON_MECANICA (N:M)
-- =========================
CREATE TABLE pokemon_mecanica (
    pokemon_id INTEGER NOT NULL,
    mecanica_id INTEGER NOT NULL,
    PRIMARY KEY (pokemon_id, mecanica_id),
    FOREIGN KEY (pokemon_id) REFERENCES pokemon(pokemon_id),
    FOREIGN KEY (mecanica_id) REFERENCES mecanica_especial(mecanica_id)
);
