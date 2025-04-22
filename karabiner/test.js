const myArrayWithObjects = {
  a: {
    name: "red",
    value: "#f00",
  },
};

const arrayWithObjects = {
  r: {
    name: "red",
    value: "#f00",
  },
};
const merge = Object.assign(arrayWithObjects, myArrayWithObjects);

console.log(merge);
