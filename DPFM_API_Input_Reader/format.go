package dpfm_api_input_reader

import (
	"data-platform-api-organization-exconf-rmq-kube/DPFM_API_Caller/requests"
)

func (sdc *SDC) ConvertToOrganization() *requests.Organization {
	data := sdc.Organization
	return &requests.Organization{
		BusinessPartner: data.BusinessPartner,
		Organization:    data.Organization,
	}
}
