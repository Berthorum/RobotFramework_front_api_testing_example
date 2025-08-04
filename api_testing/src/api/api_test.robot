*** Settings ***
Library    RequestsLibrary
Resource   ../Resources/api_url_infos.resource
Resource   ../Resources/user_credentials.resource

*** Keywords ***

Build Header
    [Arguments]    ${token}

    ${headers}    Evaluate      {"Content-Type": "application/json", "Authorization":"${token}"}

    RETURN     ${headers}

Build Body
    [Arguments]    ${acompanhante}    ${dataPartida}    ${dataRetorno}    ${localDeDestino}    ${regiao}
    
    ${body}    Create Dictionary    
    ...    acompanhante=${acompanhante}
    ...    dataPartida=${dataPartida}
    ...    dataRetorno=${dataRetorno}
    ...    localDeDestino=${localDeDestino}
    ...    regiao=${regiao}

    RETURN    ${body}
    
    
*** Test Cases ***
Exemplo GET
    ${token}     Get Token    ${user_email}    ${user_password}
    
    ${url}    Get or Create Travels URL
    ${headers}    Build Header    ${token}

    ${response}  GET
    ...  url=${url}
    ...  headers=${headers}
    ...  expected_status=200
    ...  msg=Erro ao executar chamada GET

    Should Be Empty    ${response.json()}[errors]


Exemplo POST
    ${token}    Get Token    ${admin_email}    ${admin_password}
    ${url}    Get or Create Travels URL
    
    ${headers}    Build Header    ${token}
    ${data}    Build Body
    ...    acompanhante=Manuela
    ...    dataPartida=2025-03-11
    ...    dataRetorno=2025-04-11
    ...    localDeDestino=Salvador
    ...    regiao=Nordeste

    Log To Console    ${data}

    ${response}    POST
    ...  url=${url}
    ...  json=${data}
    ...  headers=${headers}
    ...  expected_status=201
    ...  msg=Erro ao executar chamada POST

    Log To Console    ${response.json()}
    Should Be Equal    Manuela     ${response.json()}[data][acompanhante]
    Should Be Equal    Nordeste    ${response.json()}[data][regiao]
    Should Be Equal    Salvador    ${response.json()}[data][localDeDestino]


Exemplo PUT
     ${token}    Get Token    ${admin_email}    ${admin_password}
     ${url}    Update Or Delete Travel URL    1

    ${headers}     Build Header    ${token}
    ${data}    Build Body
    ...    acompanhante=Joana
    ...    dataPartida=2025-03-11
    ...    dataRetorno=2025-04-11
    ...    localDeDestino=São Paulo
    ...    regiao=Sudeste

    ${response}    PUT
    ...  url=${url}
    ...  headers=${headers}
    ...  json=${data}
    ...  expected_status=204
    ...  msg=Erro ao executar chamada PUT

    Log To Console    ${response}


Exemplo DELETE
    ${token}    Get Token    ${admin_email}    ${admin_password}
    ${url}    Update Or Delete Travel URL    1

    ${headers}    Build Header    ${token}

    ${response}    DELETE
    ...  url=${url}
    ...  headers=${headers}
    ...  expected_status=204
    ...  msg=Erro ao executar chamada DELETE

    Log To Console    ${response}