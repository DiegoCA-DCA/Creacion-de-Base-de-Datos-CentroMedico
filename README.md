# Creacion-de-Base-de-Datos-CentroMedico
Es una base de datos simulando un Centro Medico
# Base de Datos Centro Médico 🏥

Proyecto portfolio para posición **Data Analyst Junior / BI Analyst**.

## Descripción
Base de datos relacional en **SQL Server** que simula la gestión completa de un centro médico.

**Características principales**:
- 10 tablas con relaciones PK/FK bien definidas (Paciente, Médico, Especialidad, HistoriaClinica, Turno, Pago, País, etc.).
- 60 pacientes con datos ficticios consistentes (DNI, domicilio, teléfono, país).
- Historias clínicas con fechas en 2025 y observaciones médicas realistas (hasta 60 caracteres).
- Turnos, pagos y asociaciones médico-paciente.
- Consultas: JOINs múltiples, subconsultas, agregaciones y filtros.


## Tecnologías
- SQL Server
- SQL Server Management Studio (SSMS)

## Estructura de archivos
- `01_create_tables.sql` → Creación de tablas y restricciones
- `02_insert_data.sql` → Inserción de datos (pacientes, médicos, historias, etc.)
- `03_queries_ejemplo.sql` → Consultas prácticas y análisis
- `ERD.png` → Diagrama entidad-relación

## Cómo ejecutar localmente
1. Abre SSMS y crea una base de datos nueva:  
   ```sql
   CREATE DATABASE CentroMedico;
   USE CentroMedico;
