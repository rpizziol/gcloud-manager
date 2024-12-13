#!/bin/bash

kubectl scale deployment acmeair-auth-deployment acmeair-booking-bookflights-deployment acmeair-booking-cancelbooking-deployment acmeair-customer-byidget-deployment acmeair-customer-byidpost-deployment acmeair-customer-updatemiles-deployment acmeair-customer-validateid-deployment acmeair-flight-getrewardmiles-deployment acmeair-flight-queryflights-deployment --replicas=1


# acmeair-booking-bybookingnumber-deployment acmeair-booking-byuser-deployment acmeair-main-deployment
