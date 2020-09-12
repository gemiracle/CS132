close all
clear all 


db=GameDB;
mapdb=MapDB;
mpro=MovementProcessor;
uapp=UserUI;
%spro=SolutionProcessor;
 
mpro.uiApp=uapp;
mpro.GameDB=db;
mpro.MapDB=mapdb;
%mpro.solutionpro=spro;
%spro.uiApp=uapp;
%spro.movepro=mpro;
%spro.GameDB=db;

uapp.movementProcessor=mpro;
db.mprocessor=mpro;
mapdb.mprocessor=mpro;
%db.sprocessor=spro;
%uapp.solutionProcessor=spro;
 
mpro.init(1);