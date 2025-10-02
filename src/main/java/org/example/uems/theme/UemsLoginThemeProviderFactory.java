package org.example.uems.theme;

import org.keycloak.models.KeycloakSession;
import org.keycloak.models.KeycloakSessionFactory;
import org.keycloak.theme.ThemeProvider;
import org.keycloak.theme.ThemeProviderFactory;

public class UemsLoginThemeProviderFactory implements ThemeProviderFactory {
    @Override
    public ThemeProvider create(KeycloakSession session) {
        return new UemsLoginThemeProvider();
    }

    @Override
    public void init(org.keycloak.Config.Scope config) {}

    @Override
    public void postInit(KeycloakSessionFactory factory) {}

    @Override
    public void close() {}

    @Override
    public String getId() {
        return "extending";
    }
}
