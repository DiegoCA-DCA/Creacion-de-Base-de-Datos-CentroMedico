--Creacion de la Bse de datos
--Creacion de las tablas, llaves primarias y foraneas de cada tabla
-- Crear DB
CREATE DATABASE CentroMedico 
USE CentroMedico

-- Pais
CREATE TABLE Pais (
    idPais INT PRIMARY KEY IDENTITY(1,1),
    Pais NVARCHAR(50) NOT NULL
)

-- Especialidad
CREATE TABLE Especialidad (
    idEspecialidad INT PRIMARY KEY IDENTITY(1,1),
    Especialidad NVARCHAR(50) NOT NULL
)

-- Medico
CREATE TABLE Medico (
    idMedico INT PRIMARY KEY IDENTITY(1,1),
    Nombre NVARCHAR(50) NOT NULL,
    Apellido NVARCHAR(50) NOT NULL
)

-- MedicoEspecialidad (many-to-many)
CREATE TABLE MedicoEspecialidad (
    idMedico INT,
    idEspecialidad INT,
    PRIMARY KEY (idMedico, idEspecialidad),
    FOREIGN KEY (idMedico) REFERENCES Medico(idMedico),
    FOREIGN KEY (idEspecialidad) REFERENCES Especialidad(idEspecialidad)
)

-- Paciente
CREATE TABLE Paciente (
    idPaciente INT PRIMARY KEY,
    DNI INT NOT NULL UNIQUE,
    Nombre NVARCHAR(50) NOT NULL,
    Apellido NVARCHAR(50) NOT NULL,
    Domicilio NVARCHAR(100),
    idPais INT,
    Telefono NVARCHAR(20),
    FOREIGN KEY (idPais) REFERENCES Pais(idPais)
)

-- HistoriaClinica
CREATE TABLE HistoriaClinica (
    idHistoria INT PRIMARY KEY IDENTITY(1,1),
    fechaHistoria DATE NOT NULL,
    observaciones NVARCHAR(60)
)

-- HistoriaPaciente (asociación)
CREATE TABLE HistoriaPaciente (
    idHistoria INT,
    idPaciente INT,
    idMedico INT,
    PRIMARY KEY (idHistoria, idPaciente),
    FOREIGN KEY (idHistoria) REFERENCES HistoriaClinica(idHistoria),
    FOREIGN KEY (idPaciente) REFERENCES Paciente(idPaciente),
    FOREIGN KEY (idMedico) REFERENCES Medico(idMedico)
)

-- TurnoEstado (ej: 1=Confirmado, 2=Cancelado, etc.)
CREATE TABLE TurnoEstado (
    idEstado INT PRIMARY KEY IDENTITY(1,1),
    Descripcion NVARCHAR(50)
)

-- Turno
CREATE TABLE Turno (
    idTurno INT PRIMARY KEY IDENTITY(1,1),
    fechaTurno DATE NOT NULL,
    idMedico INT,
    idEstado INT,
    FOREIGN KEY (idMedico) REFERENCES Medico(idMedico),
    FOREIGN KEY (idEstado) REFERENCES TurnoEstado(idEstado)
);

-- TurnoPaciente
CREATE TABLE TurnoPaciente (
    idTurno INT,
    idPaciente INT,
    PRIMARY KEY (idTurno, idPaciente),
    FOREIGN KEY (idTurno) REFERENCES Turno(idTurno),
    FOREIGN KEY (idPaciente) REFERENCES Paciente(idPaciente)
)

-- Concepto (para pagos)
CREATE TABLE Concepto (
    idConcepto INT PRIMARY KEY IDENTITY(1,1),
    Descripcion NVARCHAR(50),
    Monto DECIMAL(10,2)
)

-- Pago
CREATE TABLE Pago (
    idPago INT PRIMARY KEY IDENTITY(1,1),
    fechaPago DATE,
    idConcepto INT,
    FOREIGN KEY (idConcepto) REFERENCES Concepto(idConcepto)
)

-- PagoPaciente
CREATE TABLE PagoPaciente (
    idPago INT,
    idPaciente INT,
    idTurno INT,
    PRIMARY KEY (idPago, idPaciente),
    FOREIGN KEY (idPago) REFERENCES Pago(idPago),
    FOREIGN KEY (idPaciente) REFERENCES Paciente(idPaciente),
    FOREIGN KEY (idTurno) REFERENCES Turno(idTurno)
)