void main() {
  print('Hello world, this is Neural Network!');
}

class Network {
  List<Layer> layers;

  Network(this.layers);

  List<double> forward(List<double> inputs) {
    var currents = inputs;
    for (var layer in layers) {
      currents = layer.forward(currents);
    }
    return currents;
  }
}

class Layer {
  List<Neuron> neurons;

  Layer(this.neurons);

  List<double> forward(List<double> inputs) {
    return [
      for (var neuron in neurons) neuron.forward(inputs),
    ];
  }
}

class Neuron {
  double forward(List<double> inputs) {
    return 0.0;
  }
}
