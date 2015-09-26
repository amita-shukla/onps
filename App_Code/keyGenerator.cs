using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Security.Cryptography;
using System.Text;

/// <summary>
/// Summary description for keyGenerator
/// </summary>
public class keyGenerator
{
	public keyGenerator()
	{
		
	}

    public static string GetUniqueId(int size)
    {
        
        char[] chars = new char[62];
        chars =
        "1234567890".ToCharArray();
        byte[] data = new byte[1];
        RNGCryptoServiceProvider crypto = new RNGCryptoServiceProvider();
        crypto.GetNonZeroBytes(data);
        data = new byte[size];
        crypto.GetNonZeroBytes(data);
        StringBuilder id = new StringBuilder(size);
        foreach (byte b in data)
        {
            id.Append(chars[b % (chars.Length)]);
        }
        return id.ToString();
    }

    public static string GetPassword(int size)
    {
        
        char[] chars = new char[65];
        chars =
        "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890@&$".ToCharArray();
        byte[] data = new byte[1];
        RNGCryptoServiceProvider crypto = new RNGCryptoServiceProvider();
        crypto.GetNonZeroBytes(data);
        data = new byte[size];
        crypto.GetNonZeroBytes(data);
        StringBuilder password = new StringBuilder(size);
        foreach (byte b in data)
        {
            password.Append(chars[b % (chars.Length)]);
        }
        return password.ToString();
    }
}