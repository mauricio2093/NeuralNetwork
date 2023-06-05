import 'dart:math';

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
  List<double> weights;

  double bias;

  Neuron(this.weights, this.bias); //bias

  double forward(List<double> inputs) {
    assert(inputs.length == weights.length);
    var result = 0.0;
    for (var i = 0; i < inputs.length; i++) {
      result += inputs[i] * weights[i];
    }
    result += bias;

    return result;
  }
}
