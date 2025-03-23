CREATE TABLE sedeB (
    codOperaio CHAR(4),
    sesso CHAR(1) NOT NULL CHECK (sesso IN ('M', 'F', 'm', 'f')),
    assuntoIl DATE NOT NULL,
    stipendio DECIMAL(10,2) NOT NULL CHECK (stipendio >= 0),
    codR INTEGER NOT NULL,
    PRIMARY KEY (codOperaio),
    FOREIGN KEY (codR) REFERENCES responsabili(codResp)
        ON DELETE RESTRICT ON UPDATE CASCADE
)