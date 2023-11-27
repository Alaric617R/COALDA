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
    char c;
    int *result;
    width = 0;
    height = 0;
    int max_val = 0;
    std::ifstream ppm_file(file_name, std::ios::binary);
    if (!ppm_file.is_open())
    {
        printf("Error opening file!\n");
        return nullptr;
    }
    std::cout << "Skipping first line...\n";
    while (ppm_file.get(c)) {
        if (c == 0x0a) break;
    }
    std::cout << "Skipping comments...\n";
    while (ppm_file.get(c)) {
        if (c == 0x23) {
            while (ppm_file.get(c)) {
                if (c == 0x0a) break;
            }
        } else {
            ppm_file.unget();
            break;
        }
    }
    std::cout << "Reading width...\n";
    while (ppm_file.get(c)) {
        if (c == 0x20 || c == 0x0a) break;
        std::cout << c << '\n';
        width = width * 10 + (c - '0');
    }
    std::cout << "Reading height...\n";
    while (ppm_file.get(c)) {
        if (c == 0x20 || c == 0x0a) break;
        std::cout << c << '\n';
        height = height * 10 + (c - '0');
    }
    std::cout << "Reading max val...\n";
    while (ppm_file.get(c)) {
        if (c == 0x20 || c == 0x0a) break;
        std::cout << c << '\n';
        max_val = max_val * 10 + (c - '0');
    }
    std::cout << "Allocating mem...\n";
    result = new int(width * height);
    std::cout << "Reading rgb data...\n";
    for (int i = 0; i < width * height; i++)
    {
        char r, g, b;
        ppm_file.get(r);
        ppm_file.get(g);
        ppm_file.get(b);
        result[3 * i + 0] = r - '0';
        result[3 * i + 1] = g - '0';
        result[3 * i + 2] = b - '0';
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