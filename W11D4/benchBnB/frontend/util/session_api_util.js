export const signup = (userForm) => {
    return $.ajax({
        url: '/api/users',
        method: 'POST',
        data: userForm
    });
};

export const login = (userForm) => {
    return $.ajax({
        url: '/api/session',
        method: 'POST',
        data: userForm
    });
};

export const logout = () => {
    return $.ajax({
        url: 'api/session',
        method: 'DELETE'
    })
};