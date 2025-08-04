*** Settings ***
Library    RequestsLibrary
Resource    ../Resources/api_url_infos.resource

*** Keywords ***
Get Token
    [Arguments]    ${email}    ${password}
    
    ${url}    Get Auth URL
    ${headers}    Evaluate    {"Content-Type": "application/json"}
    ${body}    Evaluate    {"email": "${email}", "senha": "${password}"}

    ${response_token}    POST
    ...  url=${url}
    ...  headers=${headers}
    ...  json=${body}
    ...  expected_status=200
    ...  msg=Erro ao executar chamada POST
    
    ${token_string}   Convert To String  ${response_token.json()}[data][token]
    
    RETURN    ${token_string}
  
*** Variables ***
${user_email}    usuario@email.com
${user_password}    123456

${admin_email}    admin@email.com
${admin_password}    654321