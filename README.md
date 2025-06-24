# Mongo Agent: An AI-Powered Order Management System


This project demonstrates a sophisticated, multi-agent system for automating a typical e-commerce order management workflow. It leverages the **Smol Agents** framework, **LiteLLM** for language model interaction, and **MongoDB** as a persistent database for managing products, orders, and inventory.

The system is designed to understand natural language instructions, orchestrate a series of tasks across specialized agents, and interact with a real-world database to complete a complex business process.

## 🧠 Core Features

*   **Multi-Agent Architecture**: A `manager` agent intelligently delegates tasks to specialized agents for `inventory`, `orders`, and `delivery`.
*   **LLM-Powered Orchestration**: Uses a `CodeAgent` to interpret high-level instructions, generate Python code, and coordinate the workflow.
*   **Tool-Based Capabilities**: Agents are equipped with specific "tools" (Python functions) that allow them to interact directly with the MongoDB database.
*   **Stateful Operations**: Connects to a MongoDB database to create, read, and update product stock and order information, making the process stateful and persistent.
*   **Automated Order Processing**: Demonstrates an end-to-end workflow: creating an order, updating inventory levels, and setting the delivery status.
*   **Resilience and Reasoning**: The agent system can analyze feedback from its tools, identify errors (like an invalid Order ID), and self-correct its plan to complete the task.

## 👀 How It Works: System Architecture

The project is built around a hierarchical agent system:

1.  **Manager Agent (`CodeAgent`)**: This is the "brain" of the operation. It receives a high-level task (e.g., "Process these new orders"). It doesn't have tools to interact with the database directly. Instead, its job is to create a Python script that calls upon other, more specialized agents to perform the necessary steps.

2.  **Managed Agents (`ToolCallingAgent`)**: These are the specialists who perform the actual work. Each is given a specific set of tools and a clear description of its role.
    *   **Inventory Agent**: Manages product stock. Its tools are `check_stock` and `update_stock`.
    *   **Order Agent**: Handles order creation. Its tool is `create_order`.
    *   **Delivery Agent**: Manages shipping status. Its tool is `update_delivery_status`.

The `manager` agent breaks down the main goal into sub-tasks, delegates each to the appropriate agent, and synthesizes their results to complete the overall objective.