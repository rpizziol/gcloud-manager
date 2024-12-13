#!/bin/bash

cd "../"

# Mongo
cd "./acmeair-mongo-database/kubernetes/"
kubectl apply -f deployment.yaml
sleep 1
cd "../.."

# Auth
cd "./acmeair-authservice-springboot/kubernetes/"
kubectl apply -f deployment.yaml
sleep 1
cd "../.."

# Customer
cd "./acmeair-customerservice-springboot/kubernetes/"
kubectl apply -f deployment-byidget.yaml
sleep 1
kubectl apply -f deployment-byidpost.yaml
sleep 1
kubectl apply -f deployment-updatemiles.yaml
sleep 1
kubectl apply -f deployment-validateid.yaml
sleep 1
cd "../.."

# Booking
cd "./acmeair-bookingservice-springboot/kubernetes/"
kubectl apply -f deployment-bookflights.yaml
sleep 1
kubectl apply -f deployment-cancelbooking.yaml
sleep 1
cd "../.."

# Flight
cd "./acmeair-flightservice-springboot/kubernetes/"
kubectl apply -f deployment-getrewardmiles.yaml
sleep 1
kubectl apply -f deployment-queryflights.yaml
sleep 1
cd "../.."

# HAProxy
cd "./acmeair-proxy/kubernetes/"
kubectl apply -f deployment.yaml
sleep 1

