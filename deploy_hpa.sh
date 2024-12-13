#!/bin/bash

cd "../"

# Main
# cd "./acmeair-mainservice-springboot/kubernetes/"
# kubectl apply -f hpa-main.yaml
# sleep 1
# cd "../.."

# Auth
cd "./acmeair-authservice-springboot/kubernetes/"
kubectl apply -f hpa-auth.yaml
sleep 1
cd "../.."


# Customer
cd "./acmeair-customerservice-springboot/kubernetes/"
source deploy-customer-hpa.sh
cd "../.."

# Booking
cd "./acmeair-bookingservice-springboot/kubernetes/"
source deploy-booking-hpa.sh
cd "../.."

# Flight
cd "./acmeair-flightservice-springboot/kubernetes/"
source deploy-flight-hpa.sh
cd "../.."