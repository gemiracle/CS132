close all
clear all

Database = InjectionDB;
Processor = InjectionProcessor;
PaApp = PatientUI;
PhApp = PhysicianUI;

Processor.patientApp = PaApp;
Processor.physicianApp = PhApp;
Processor.injectionDB = Database;

Database.processor = Processor;

PaApp.DB = Database;
PaApp.Pro = Processor;
PaApp.physician = PhApp;

PhApp.DB = Database;
PhApp.Pro = Processor;
PhApp.patient = PaApp;
