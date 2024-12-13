#!/bin/bash

cd "../"

# Mongo
cd "./acmeair-mongo-database/kubernetes/"
kubectl apply -f deployment.yaml
sleep 1
kubectl apply -f service.yaml
sleep 1
cd "../.."

# Main
# cd "./acmeair-mainservice-springboot/kubernetes/"
# kubectl apply -f deployment.yaml
# sleep 1
# kubectl apply -f deployment-2.yaml
# sleep 1
# kubectl apply -f service.yaml
# sleep 1
# cd "../.."

# Auth
cd "./acmeair-authservice-springboot/kubernetes/"
kubectl apply -f deployment.yaml
sleep 1
# kubectl apply -f deployment-2.yaml
# sleep 1
kubectl apply -f service.yaml
sleep 1
cd "../.."


# Customer
cd "./acmeair-customerservice-springboot/kubernetes/"
source deploy-customer-services.sh
cd "../.."

# Booking
cd "./acmeair-bookingservice-springboot/kubernetes/"
source deploy-booking-services.sh
cd "../.."

# Flight
cd "./acmeair-flightservice-springboot/kubernetes/"
source deploy-flight-services.sh
cd "../.."

# HAProxy
cd "./acmeair-proxy/kubernetes/"
kubectl apply -f deployment.yaml
sleep 1
kubectl apply -f service.yaml
sleep 1
