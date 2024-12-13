#!/bin/bash


# kubectl delete deployment acmeair-auth-deployment acmeair-booking-bookflights-deployment acmeair-booking-bybookingnumber-deployment acmeair-booking-byuser-deployment acmeair-booking-cancelbooking-deployment acmeair-customer-byidget-deployment acmeair-customer-byidpost-deployment acmeair-customer-updatemiles-deployment acmeair-customer-validateid-deployment acmeair-flight-getrewardmiles-deployment acmeair-flight-queryflights-deployment acmeair-main-deployment haproxy-deployment mongo-deployment

kubectl delete deployment acmeair-auth-deployment-2 acmeair-booking-bookflights-deployment-2 acmeair-booking-bybookingnumber-deployment-2 acmeair-booking-byuser-deployment-2 acmeair-booking-cancelbooking-deployment-2 acmeair-customer-byidget-deployment-2 acmeair-customer-byidpost-deployment-2 acmeair-customer-updatemiles-deployment-2 acmeair-customer-validateid-deployment-2 acmeair-flight-getrewardmiles-deployment-2 acmeair-flight-queryflights-deployment-2 acmeair-main-deployment-2

# kubectl delete service auth bookingbookflights bookingbybookingnumber bookingbyuser bookingcancelbooking customerbyidget customerbyidpost customerupdatemiles customervalidateid flightgetrewardmiles flightqueryflights haproxy kubernetes main mongohost