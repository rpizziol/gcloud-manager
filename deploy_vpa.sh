#!/bin/bash

cd "../"

# Main
cd "./acmeair-mainservice-springboot/kubernetes/"
kubectl apply -f vpa-main.yaml
sleep 1
cd "../.."

# Auth
cd "./acmeair-authservice-springboot/kubernetes/"
kubectl apply -f vpa-auth.yaml
sleep 1
cd "../.."


# Customer
cd "./acmeair-customerservice-springboot/kubernetes/"
source deploy-customer-vpa.sh
cd "../.."

# Booking
cd "./acmeair-bookingservice-springboot/kubernetes/"
source deploy-booking-vpa.sh
cd "../.."

# Flight
cd "./acmeair-flightservice-springboot/kubernetes/"
source deploy-flight-vpa.sh
cd "../.."