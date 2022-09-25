package terraform

import input as tfplan

default allow := false

allow {
    count(resources) == 0
}

####################
# Terraform Library
####################

# list of all resources of type "google_compute_firewall" and log_config is present
resources := [name |
    name := tfplan.resource_changes[_]
    name.type == "google_compute_firewall"
    not name.change.after.log_config
]
