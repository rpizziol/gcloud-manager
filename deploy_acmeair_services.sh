#!/bin/bash

cd "../"

# Mongo
cd "./acmeair-mongo-database/kubernetes/"
kubectl apply -f service.yaml
sleep 1
cd "../.."

# Auth
cd "./acmeair-authservice-springboot/kubernetes/"
kubectl apply -f service.yaml
sleep 1
cd "../.."


# Customer
cd "./acmeair-customerservice-springboot/kubernetes/"
kubectl apply -f service-byidget.yaml
sleep 1
kubectl apply -f service-byidpost.yaml
sleep 1
kubectl apply -f service-updatemiles.yaml
sleep 1
kubectl apply -f service-validateid.yaml
sleep 1
cd "../.."

# Booking
cd "./acmeair-bookingservice-springboot/kubernetes/"
kubectl apply -f service-bookflights.yaml
sleep 1
kubectl apply -f service-cancelbooking.yaml
sleep 1
cd "../.."

# Flight
cd "./acmeair-flightservice-springboot/kubernetes/"
kubectl apply -f service-getrewardmiles.yaml
sleep 1
kubectl apply -f service-queryflights.yaml
sleep 1
cd "../.."

# HAProxy
cd "./acmeair-proxy/kubernetes/"
kubectl apply -f service.yaml
sleep 1
