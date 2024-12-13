#!/bin/bash

cd "../"

# Auth
cd "./acmeair-authservice-springboot/kubernetes/"
kubectl apply -f deployment-2.yaml
sleep 1
cd "../.."

# Customer
cd "./acmeair-customerservice-springboot/kubernetes/"
kubectl apply -f deployment-byidget-2.yaml
sleep 1
kubectl apply -f deployment-byidpost-2.yaml
sleep 1
kubectl apply -f deployment-updatemiles-2.yaml
sleep 1
kubectl apply -f deployment-validateid-2.yaml
sleep 1
cd "../.."

# Booking
cd "./acmeair-bookingservice-springboot/kubernetes/"
kubectl apply -f deployment-bookflights-2.yaml
sleep 1
kubectl apply -f deployment-cancelbooking-2.yaml
sleep 1
cd "../.."

# Flight
cd "./acmeair-flightservice-springboot/kubernetes/"
kubectl apply -f deployment-getrewardmiles-2.yaml
sleep 1
kubectl apply -f deployment-queryflights-2.yaml
sleep 1
cd "../.."
