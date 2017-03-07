package com.malikov.productmanager;

import com.malikov.productmanager.matcher.ModelMatcher;
import com.malikov.productmanager.model.Role;
import com.malikov.productmanager.model.User;

import java.util.Objects;

public class UserTestData {
    public static final User USER = new User(1, "user", "$2a$11$bRQR2FxnBrKnr/PS0eaDUeEQzO2ZtYJllGPIkdekZ0q6rJVJrCmXm", Role.ROLE_USER);
    public static final User ADMIN= new User(2, "admin", "$2a$11$bRQR2FxnBrKnr/PS0eaDUeEQzO2ZtYJllGPIkdekZ0q6rJVJrCmXm", Role.ROLE_ADMIN, Role.ROLE_USER);

    public static final ModelMatcher<User> MATCHER = ModelMatcher.of(User.class,
            (expected, actual) -> expected == actual ||
                    (Objects.equals(expected.getId(), actual.getId())
                            && Objects.equals(expected.getName(), actual.getName())
                            && Objects.equals(expected.getPassword(), actual.getPassword())
                            && Objects.equals(expected.getRoles(), actual.getRoles())
                    )
    );
}
