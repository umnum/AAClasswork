export const allTodos = (state) => {
  const keys = Object.keys(state.todos);
  return keys.map((idx) => state.todos[idx]);
}