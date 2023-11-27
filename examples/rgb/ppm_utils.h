#include <fstream>
#include <string>
#include <iostream>
#include <sstream>

// 0x20: space, 0x23: hashtag, 0x0a: eol
// Idea:
// Skip over the first end of line
// While pointing to a 0x23, skip over the next end of line
// Read width and height, ascii, skip over end of line
// Read max val, ascii. skip over end of line
// Read by byte, store the byte as int to dynamic memory

int *read_ppm(std::string file_name, int &width, int &height)
{
    int *result;
    int max_val = 0;
    std::string line;
    std::ifstream ppm_file(file_name, std::ios::binary);
    if (!ppm_file.is_open())
    {
        printf("Error opening file!\n");
        return nullptr;
    }
    std::getline(ppm_file, line);
    std::cout << line << "\n";
    getline(ppm_file, line);    // Skip comment
    std::cout << line << "\n";
    getline(ppm_file, line);
    std::istringstream(line) >> width >> height;
    std::cout << width << height;
    getline(ppm_file, line);
    std::istringstream(line) >> max_val;
    std::cout << width << height;
    result = new int(width * height);
    for (int i = 0; i < width * height; i++)
    {
        int r, g, b;
        ppm_file >> r >> g >> b;
        result[3 * i + 0] = r;
        result[3 * i + 1] = g;
        result[3 * i + 2] = b;
    }
    ppm_file.close();
    return result;
}

void write_ppm(std::string file_name, int *data, int width, int height)
{
    std::ofstream ppm_file(file_name);
    if (!ppm_file.is_open())
    {
        printf("Error opening file for writing!\n");
        return;
    }
    ppm_file << "P3\n"
             << width << " " << height << "\n"
             << "255\n";
    for (int i = 0; i < height * width; i++)
    {
        ppm_file << data[3 * i + 0] << " " << data[3 * i + 1] << " " << data[3 * i + 2] << "\n";
    }
    ppm_file.close();
    return;
}