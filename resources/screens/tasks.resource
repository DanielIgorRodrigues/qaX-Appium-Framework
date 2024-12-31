*** Settings ***
Documentation    Elementos e ações da tela minhas tarefas

Library    AppiumLibrary

*** Variables ***
${new_task_input}    xpath=//*[@resource-id="newTask"]
${create_button}     xpath=//*[@resource-id="createTask"]    


*** Keywords ***
Create a new task
    [Arguments]        ${task_name}

    Wait Until Element Is Visible    ${new_task_input}    10

    Input Text       ${new_task_input}     ${task_name}
    Click Element    ${create_button}


Should have task
    [Arguments]    ${task_name}

    Wait Until Element Is Visible    
    ...    xpath=//*[@resource-id="taskText"][@text="${task_name}"]
    ...    5


Remove task by name
    [Arguments]    ${task_name}
    
    Click Element                      xpath=//*[@text="${task_name}"]/../..//*[@resource-id="removeTask"]
    Wait Until Page Contains           Tem certeza que deseja remover a tarefa?
    
    ${yes_button}    Set Variable    xpath=//android.widget.Button[@text="SIM"]

    Wait Until Element Is Visible      ${yes_button}    5
    Click Element                      ${yes_button}

Should not have task
    [Arguments]    ${task_name}

    Page Should Not Contain Element    xpath=//*[@resource-id="taskText"][@text="${task_name}"]

Finish task by name
    [Arguments]    ${task_name}

    Click Element                xpath=//*[@text="${task_name}"]/..
    

Task should be done
    [Arguments]    ${task_name}
    
    Element Should Be Visible    xpath=//*[@text="${task_name}"]/..//android.widget.ImageView