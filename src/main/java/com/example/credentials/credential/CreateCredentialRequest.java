package com.example.credentials.credential;

public class CreateCredentialRequest {

    private String id;
    private String password;

    public CreateCredentialRequest() {
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
