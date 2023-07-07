---
title: "TypeScript Generics Explained ! "
description: "Short story about Generics in TS"
pubDate: "Sep 22 2022"
heroImage: "https://res.cloudinary.com/damarowen/image/upload/v1665298999/Blog/g1d6by9mwmwugfa5a9qq.jpg"
badge: "Demo badge"

---
## Background Story
if you have a function like 

```js
function printData(data: number | string | boolean | any}) {
    console.log("data: ", data);
}

printData(2);
printData("hello");
printData(true);
```

that return data value is more than two, I think will need to refactor that, so we use **Generic** to solve that !
## How Generics Work in TS

Generics are like variables – to be precise, type variables – that store the type (for example number, string, boolean) as a value.

So, you can solve the problem we discussed above with generics as shown below:

```js
function printData<T>(data: T) {
    console.log("data: ", data);
}

printData(2);
printData("hello");
printData(true);

```

You use a type variable inside angular brackets after the function name <T>
You then assign the type variable to the parameter data: T
Let's explore these differences a bit more.
## How to Use Generics with Interfaces
You can even use generics with interfaces. Let's see how that works with the help of a code snippet:

```js
interface UserData<X,Y> {
    name: X;
    rollNo: Y;
}

const user: UserData<string, number> = {
    name: "Ram",
    rollNo: 1
}
```

In above snippet, <string, number> are passed to the interface UserData. In this way, UserData becomes a reusable interface in which any data type can be assigned depending upon the use case.

## Thanks for reading!
