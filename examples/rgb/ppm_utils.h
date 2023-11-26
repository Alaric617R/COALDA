#include <fstream>
#include <string>
#include <sstream>

int *read_ppm(std::string file_name, int &width, int &height)
{
    int *result;
    int max_val;
    std::string line;
    std::ifstream ppm_file(file_name);
    if (!ppm_file.is_open())
    {
        printf("Error opening file!\n");
        return nullptr;
    }
    std::getline(ppm_file, line);
    while (getline(ppm_file, line) && line[0] == '#')
    {
        continue;
    }
    ppm_file >> width >> height >> max_val;
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