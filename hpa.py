from kubernetes import client, config

cpu_request = 1
cpu_limit = 16

acmeair_keywords = ["acmeair-main", "acmeair-auth",
					   "acmeair-customer-byidget", "acmeair-customer-byidpost", "acmeair-customer-updatemiles", "acmeair-customer-validateid",
					   "acmeair-booking-bookflights", "acmeair-booking-bybookingnumber", "acmeair-booking-byuser", "acmeair-booking-cancelbooking",
					   "acmeair-flight-getrewardmiles", "acmeair-flight-queryflights"]

def patch_deployment(keyword, cpu_request, cpu_limit):
	deployment_name = f"{keyword}-deployment"

	config.load_kube_config()  # Load configuration from kubeconfig
	apps_v1 = client.AppsV1Api()
	patch_body = {
			"spec": {
			"template": {
				"spec": {
					"containers": [
						{
							"name": f"{keyword}-container",
							"resources": {
								"requests": {
									"cpu": cpu_request
								},
								"limits": {
								"cpu": cpu_limit
								}
							}
						}
					]
				}
			}
		}
	}

	try:
		apps_v1.patch_namespaced_deployment(
			name=deployment_name,
			namespace="default",
			body=patch_body
		)
		print(f"Deployment {deployment_name} patched successfully.")
	except Exception as e:
		print(f"Error patching deployment: {e}")




for acmeair_keyword in acmeair_keywords:
	patch_deployment(acmeair_keyword, cpu_request, cpu_limit)