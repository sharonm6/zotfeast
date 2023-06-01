import torch
import torch.nn as nn
import torch.optim as optim

# Define your model class
class Notif(nn.Module):
    def __init__(self, input_dim, hidden_dim, output_dim):
        super(Notif, self).__init__()
        self.fc1 = nn.Linear(input_dim, hidden_dim)
        self.relu = nn.ReLU()
        self.fc2 = nn.Linear(hidden_dim, output_dim)

    def forward(self, x):
        x = self.fc1(x)
        x = self.relu(x)
        x = self.fc2(x)
        return x

# Define your training loop
def train(model, train_loader, loss_fn, optimizer, epochs):
    model.train()
    for epoch in range(epochs):
        total_loss = 0.0
        for inputs, targets in train_loader:
            optimizer.zero_grad()
            outputs = model(inputs)
            loss = loss_fn(outputs, targets)
            loss.backward()
            optimizer.step()
            total_loss += loss.item()
        print("Epoch:", epoch+1, "Loss:", total_loss)

# Prepare your data
# ... Code for preparing and loading the schedule and target data ...

# Define hyperparameters and instantiate your model
input_dim = ...  # Dimensionality of your input features
hidden_dim = ...  # Dimensionality of the hidden layer
output_dim = ...  # Dimensionality of the output (recommended times)
learning_rate = ...
epochs = ...

model = Notif(input_dim, hidden_dim, output_dim)

# Define loss function and optimizer
loss_fn = nn.MSELoss()
optimizer = optim.Adam(model.parameters(), lr=learning_rate)

# Create your data loaders
# ... Code for creating data loaders from your prepared data ...

# Train your model
train(model, train_loader, loss_fn, optimizer, epochs)

# Make predictions
# ... Code for making predictions using the trained model ...
