/// <reference lib="deno.ns" />

import { greet } from "./deps.ts";

const name = Deno.args[0] ?? "world";
console.log(greet(name));
