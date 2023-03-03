# Currents

Generated field vectors, simulating fluid flows, built with Processing.

# Description

### Area

The class `Area` is where a 2D field of vectors is defined which can be used to simulate various movements such as fluid flow, wind or magnetics fields. In this class, the following properties are set up:

- `ff`: a 2D array of vector objects, which will store the field vectors.
- `cols` & `rows`: integers representing the number of columns and rows in the field.
- `index`: an integer representing the resolution of the field.
- `img`: a source image object.
- `ang`: a float representing the angle of the flow.

The `depo()` method is used to inject vectors into the field at specific locations and the `iter()` method is used to retrieve the vector at a given point in the field.

---

### Curves

The class `Curves` defines a "curve" object and simulates the movement and interaction of multiple curves in an environment.

- The variables: `pos`, `vel`, `acc`, `futV`, `futP`, `preP`, `Vmax`, `Fmax`, `ang`, and `r`, store position, velocity, acceleration, maximum velocity, maximum force, angle, and radius, respectively.
- The constants defined as `sradius`, `rand`, and `col`, determine the radius of a circle, a random value, and the color of the curve, respectively.
- The constructor initializes some of the member variables, including the position, velocity, and acceleration of the curve, as well as its maximum velocity and maximum force, which are randomly determined based on some input values.
- The `update()` method updates the position and velocity of the curve based on its current acceleration.
- The `futPos()` method calculates the future position of the curve based on its velocity.
- The `follow()` method adjusts the acceleration of the curve based on the "current" environment represented by the Area object fa.
- The `find()` method adjusts the acceleration of the curve based on a target point.
- The `spin()` method adjusts the acceleration of the curve to make it spin around its own axis.
- The `edge()` method ensures that the curve stays within the bounds of the window.
- The `proceed()` method is the main method that updates the curve's position and acceleration based on its environment and other factors. It also draws a line between the curve's current and previous positions if they are close enough.

---

### Currents

The `setup()` function initializes the size of the canvas, creates two instances of the `Area` class, which represent fields of flow vectors that affect the movement of the curves, and loads an image named "source.jpg" to extract colors from it. Then it creates two ArrayLists to hold instances of the `Curves` class, and adds a large number of curves to each of them using a for loop that initializes each curve's position and color.

The `draw()` function is called continuously, and it first fills the background with a transparent black rectangle. Then, for each curve in the ArrayList `curves1`, it calls the `proceed()` function to update its position and movement according to the `f1` field only. After that, it does the same for each curve in the `curves` ArrayList, but it calls `proceed()` with both `f1` and `f` as parameters, which means that these curves are affected by the flow vectors of both fields. Finally, it goes through `curves1` again and calls `proceed()` with `f1` only, to give the impression of some curves moving on top of the others.

# Preview

https://user-images.githubusercontent.com/85762786/222700884-a55446b2-77ac-4d52-bf92-dbab66d97248.mp4

