import raylib;

void main()
{
    // Initalise
    const int screenWidth = 800;
    const int screenHeight = 450;

    InitWindow(screenWidth, screenHeight, "raylib [core] example - 3d camera mode");

    // Define a camera
    const Vector3 cameraPosition = {2.0f, 5.0f, 7.0f}; // Camera position
    const Vector3 cameraTarget = {0.0f, 1.0f, 0.0f}; // Camera looking at point
    const Vector3 cameraUp = {0.0f, 1.0f, 0.0f}; // Camera up vector (rotation towards target)
    const float cameraFovy = 45.0f; // Camera field-of-view Y
    const CameraType cameraType = CameraType.CAMERA_PERSPECTIVE; // Camera mode type

    Camera3D camera = {
        cameraPosition, cameraTarget, cameraUp, cameraFovy, cameraType
    };

    SetCameraMode(camera, CameraMode.CAMERA_ORBITAL);

    Vector3 cubePosition = {0.0f, 1.0f, 0.0f};

    SetTargetFPS(60);

    // Main game loop
    while (!WindowShouldClose()) // Detect window close button or ESC key
    {
        // Update
        UpdateCamera(&camera);

        // Draw
        BeginDrawing();

        ClearBackground(Colors.LIGHTGRAY);

        BeginMode3D(camera);

        DrawCube(cubePosition, 2.0f, 2.0f, 2.0f, Colors.RED);
        DrawCubeWires(cubePosition, 2.0f, 2.0f, 2.0f, Colors.MAROON);

        DrawGrid(10, 1.0f);
        EndMode3D();
        DrawText("Rotate test.", 10, 40, 20, Colors.DARKGRAY);
        DrawFPS(10, 10);

        EndDrawing();
    }

    // Clean-up
    CloseWindow(); // Close window and OpenGL context
}
