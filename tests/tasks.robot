*** Settings ***
Documentation    Suite de testes do cadastro de tarefas

Resource    ../resources/base.resource

Test Setup       Start session
Test Teardown    Finish session

*** Test Cases ***
Deve poder cadastrar uma nova tarefa
    
    ${task}    Set Variable    Estudar Python
    Remove task from database    ${task}

    Do login
    Create a new task    ${task}
    Should have task     ${task}

Deve poder remover uma tarefa indesejada
    [Tags]    remove
    
    ${task}    Set Variable   Comprar refrigerante
    Remove task from database    ${task}

    Do login
    Create a new task       ${task}
    Should have task        ${task}
    Remove task by name     ${task}
    Should not have task    ${task}

Deve poder concluir uma tarefa
    [Tags]    concluida
    
    ${task}    Set Variable   Estudar Xpath
    Remove task from database    ${task}

    Do login
    Create a new task       ${task}
    Should have task        ${task}

    Finish task by name     ${task}
    Task should be done     ${task}

    Sleep    10