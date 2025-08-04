*** Variables ***
${BASE_URL}    http://localhost:8089/api
${ENDPOINT}    /v1/viagens
${AUTH_ENDPOINT}    /v1/auth

*** Keywords ***
Get or Create Travels URL
    RETURN    ${BASE_URL}${ENDPOINT}

Update or Delete Travel URL
    [Arguments]  ${id}

    RETURN     ${BASE_URL}${ENDPOINT}/${id}

Get Auth URL
    RETURN    ${BASE_URL}${AUTH_ENDPOINT}

