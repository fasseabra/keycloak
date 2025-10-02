package org.example.uems.theme;

import java.util.Collections;
import java.util.Set;

import org.keycloak.theme.Theme;
import org.keycloak.theme.Theme.Type;
import org.keycloak.theme.ThemeProvider;

public class UemsLoginThemeProvider implements ThemeProvider {

    private static final String THEME_NAME = "uems-login";
    private static final Type THEME_TYPE = Type.LOGIN;

    @Override
    public Theme getTheme(String name, Type type) {
        if (THEME_NAME.equals(name) && THEME_TYPE.equals(type)) {
            // Retorna null, e o Keycloak vai procurar o tema na pasta /themes/uems-login
            return null;
        }
        return null;
    }

    @Override
    public Set<String> nameSet(Type type) {
        if (THEME_TYPE.equals(type)) {
            return Collections.singleton(THEME_NAME);
        }
        return Collections.emptySet();
    }

    @Override
    public boolean hasTheme(String name, Type type) {
        return THEME_NAME.equals(name) && THEME_TYPE.equals(type);
    }

    @Override
    public int getProviderPriority() {
        return 0;
    }

    @Override
    public void close() {
        // Nada a liberar
    }
}
