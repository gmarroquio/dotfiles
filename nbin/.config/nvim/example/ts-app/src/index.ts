const greet = (name: string) => `Hello, ${name}!`;

export const main = () => {
  const name = process.argv[2] ?? "world";
  console.log(greet(name));
};

if (import.meta.main) {
  main();
}
