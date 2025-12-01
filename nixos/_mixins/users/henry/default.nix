{ username, ... }:
{
  users.users.henry = {
    description = "Henry Senanian";
    # mkpasswd -m sha-512
    hashedPassword = "$6$mztFhoyykGT7X6OR$huepGbBBtgTsxcHgX320ajc2zLUPik8Nn/QkBKZA7yEFXpsRLAnibe1I/eIebqqR5q3Kyn3PgDq0akeH0hPWV1";
  };
}
