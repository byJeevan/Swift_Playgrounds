## Closures

### Defination & Introduction
- *Closures* are self-contained blocks of functionality that can be passed around and used in your code.
- *Closure expressions* are a way to write inline closures in a brief, focused syntax
- Closure expression syntax has the following general form:
  ```
  { (<parameters>) -> <return type> in
      <statements>
  }
  ```
- *parameters* can be : 
  - in-out types. But can't have default value.
  - Variadic parameters
  - Tuples can be parameters or return type.
  
- The start of the closure’s body is introduced by the `in` keyword.


### Closures take one of three forms
#### 1. Global functions are closures that have a name and don’t capture any values.
#### 2. Nested functions are closures that have a name and can capture values from their enclosing function.
#### 3. Closure expressions are unnamed closures written in a lightweight syntax that can capture values from their surrounding context.

### Closures are Reference Types

### Escaping Closures
